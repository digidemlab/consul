class CensusCaller

  def call(document_type, document_number)
    NoBorderApi.new.call(document_type, document_number)
  end
end
