class Banco < ActiveRecord::Base
  self.table_name = "BANCO"
  self.primary_key = "BCO_CODG"
end