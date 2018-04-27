class Raw
  def execute_query(sql)
    ActiveRecord::Base.connection.exec_query(sql)
  end
  def to_pdf(html)
    WickedPdf.new.pdf_from_string(html)
  end
end

# "banco/index.html.erb"