class NoBorderApi

  def call(document_type, document_number)
    Response.new(document_type, document_number)
  end

  class Response
    def initialize(document_type, document_number)
      @document_type = document_type
      @document_number = document_number
    end

    def valid?
      true
    end

    def date_of_birth
      Date.parse('1st Jan 1901')
    end

    def region
      nil
    end

    def gender
      nil
    end
  end
end
