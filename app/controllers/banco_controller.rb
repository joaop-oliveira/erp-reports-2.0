class BancoController < ApplicationController
  def index

    sql = "select
            c.cta_num,
            c.cta_cta_bancaria,
            c.cta_cta_bancaria_dig,
            c.emp_codg,
            c.age_num,
            e.emp_fantasia,
            pac_banco.saldo_conta_na_data(sysdate+1,c.cta_num)Saldo,
            a.bco_codg as banco
          from
            conta_bancaria c,
            agencia a,
            empresa e
          where
              c.age_num = a.age_num
          and c.emp_codg = e.emp_codg
          and c.cta_tipo = 'E'
          and c.cta_ativa = 'S'"
    raw = Raw.new
    result_data_set = raw.execute_query(sql)
    @demo_geral = result_data_set
    total = 0
    result_data_set.each do |item|
      total = item["saldo"] + total
    end
    @send_total = total
    html_string = render_to_string "banco/index.html.erb"
    pdf = raw.to_pdf(html_string)
    send_data pdf, filename: "report.pdf", disposition: "inline"
  end
end