module Abbyy
  class API < SimpleDelegator
    def execute(meth, *args, &block)
      send meth, *args, &block
    rescue RestClient::BlockedByWindowsParentalControls => ex
      raise Abbyy::IncorrectParameters.new(parse_error(ex).message)
    rescue RestClient::RequestFailed => ex
      raise Abbyy::ProcessingFailed.new(parse_error(ex).message)
    end

    # https://www.ocrsdk.com/documentation/api-reference/get-application-info-method/
    def application_info
      RestClient.get("#{url}/getApplicationInfo")
    end

    # http://ocrsdk.com/documentation/apireference/getTaskStatus/
    def get_task_status(task_id = task[:id])
      RestClient.get("#{url}/getTaskStatus?taskId=#{task_id}")
    end

    # http://ocrsdk.com/documentation/apireference/processBusinessCard/
    def process_business_card(image_path, options = {})
      RestClient.post("#{url}/processBusinessCard", options.merge(:upload => { :file => File.new(image_path, 'r') }))
    end

    # http://ocrsdk.com/documentation/apireference/processDocument/
    def process_document(task_id = task[:id], options={})
      RestClient.get("#{url}/processDocument?taskId=#{task_id}", params: options)
    end

    # http://ocrsdk.com/documentation/apireference/processFields/
    def process_fields(file_path, task_id = task[:id], options = {})
      RestClient.post("#{url}/processFields?taskId=#{task_id}", options.merge(:upload => { :file => File.new(file_path, 'r') }))
    end

    # https://www.ocrsdk.com/documentation/api-reference/process-image-method/
    def process_image(image_path, options = {})
      RestClient.post("#{url}/processImage", options.merge(:upload => { :file => File.new(image_path, 'r') }))
    end

    # https://www.ocrsdk.com/documentation/api-reference/process-mrz-method/
    def process_mrz(image_path, options = {})
      RestClient.post("#{url}/processMRZ", options.merge(:upload => { :file => File.new(image_path, 'r') }))
    end

    # https://www.ocrsdk.com/documentation/api-reference/process-receipt-method/
    def process_receipt(receipt_path, options = {})
      RestClient.post("#{url}/processReceipt", options.merge(:upload => { :file => File.new(receipt_path, 'r') }))
    end

    # http://ocrsdk.com/documentation/apireference/processTextField/
    def process_text_field(image_path, options = {})
      RestClient.post("#{url}/processTextField", options.merge(:upload => { :file => File.new(image_path, 'r') }))
    end

    # http://ocrsdk.com/documentation/apireference/submitImage/
    def submit_image(image_path, options = {})
      RestClient.post("#{url}/submitImage", options.merge(:upload => { :file => File.new(image_path, 'r') }))
    end
  end
end
