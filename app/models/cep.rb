require 'net/http'
class CEP
  attr_reader :logradouro, :bairro, :localidade, :uf

  END_POINT = "https://viacep.com.br/ws/"
  FORMAT = "json"

  def initialize(cep)
    cep = find_cep(cep) # hash
    preencher_dados(cep)
  end

  def endereco
    "#{@logradouro} / #{@bairro} / #{@localidade} - #{@uf}"
  end

  private

  def preencher_dados(cep)
    @logradouro = cep["logradouro"]
    @bairro     = cep["bairro"]
    @localidade = cep["localidade"]
    @uf         = cep["uf"]
  end

  def find_cep(cep)
    ActiveSupport::JSON.decode(
      Net::HTTP.get(
        URI("#{END_POINT}#{cep}/#{FORMAT}/")
      )
    )
  end
end