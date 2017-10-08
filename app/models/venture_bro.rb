class VentureBro
  HEADERS = {"Accept" => "application/json",
            "X-User-Email" => ENV['API_EMAIL'],
            "api_key" => "Token token=#{ENV['API_KEY']}"}

  attr_accessor :id, :character, :vehicle, :organization, :quote

  def initialize(options_hash)
    @id = options_hash['id']
    @character = options_hash['character']
    @vehicle = options_hash['vehicle']
    @organization = options_hash['organization']
    @quote = options_hash['quote']
  end

  def always_yelling
    @quote.upcase
  end

  def self.find(venture_bro_id)
    VentureBro.new(Unirest.get(
                              "#{ ENV['HOST_NAME']}/api/v2/venture_bros/#{ venture_bro_id }",
                              headers: HEADERS).body)
  end

  def self.all
    response = Unirest.get("#{ ENV['HOST_NAME'] }/api/v2/venture_bros.json",
                          headers: HEADERS).body
    response.each do |vb_hash|
      VentureBro.new(vb_hash)
    end
    ObjectSpace.each_object(self).to_a
  end

  def destroy
    Unirest.delete(
      "#{ ENV['HOST_NAME'] }/api/v2/venture_bros/#{ id }.json",
      headers: { "Accept" => "application/json"}
      ))
  end

  def self.create(employee_params)
    response = Unirest.post("#{ ENV['HOST_NAME']}/api/v2/venture_bros.json",
                            headers: HEADERS,
                            parameters: employee_params
                            ).body
    Employee.new(response)
  end

  def self.update(employee_params)
    response = Unirest.patch(
                            "#{ ENV['HOST_NAME']}/api/v2/venture_bros/#{ id }.json",
                            headers: HEADERS,
                            params: employee_params
                            )
  end
end