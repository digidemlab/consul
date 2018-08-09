class PersonnummerApi

  def call(document_type, document_number)
    Response.new(document_type, document_number)
  end

  class Response
    def initialize(document_type, document_number)
      @document_type = document_type
      @document_number = document_number
      if personnummer?
        begin
          @personnummer = Personnummer.new(document_number)
        end
      end
    end

    def valid?
      if personnummer?
        valid_personnummer?
      else
        true
      end
    end

    def date_of_birth
      if valid_personnummer?
        @personnummer.born
      else
        nil
      end
    end

    def region
      if valid_personnummer?
        @personnummer.region
      else
        nil
      end
    end

    def gender
      if valid_personnummer?
        if @personnummer.female?
          "female"
        else
          "male"
        end
      else
        nil
      end
    end

    private

      def personnummer?
        @document_type.to_s == "1"
      end

      def valid_personnummer?
        personnummer? && @personnummer != nil && @personnummer.valid?
      end
  end
end
