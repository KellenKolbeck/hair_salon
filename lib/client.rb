class Client

  attr_reader(:client_name, :id, :stylist_id)

  define_method(:initialize) do |attributes|
    @client_name = attributes.fetch(:client_name)
    @id = attributes.fetch(:id)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    client_list = []
      returned_clients.each() do |customer|
        client_name = customer.fetch('client_name')
        id = customer.fetch('id').to_i()
        stylist_id = customer.fetch('stylist_id')
        client_list.push(Client.new({:client_name => client_name, :id => id, :stylist_id => stylist_id}))
      end
    client_list
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (client_name, stylist_id) VALUES ('#{@client_name}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  define_method(:==) do |another_client|
    self.client_name() == another_client.client_name() && self.id() ==another_client.id()
  end

  define_singleton_method(:clear) do
    DB.exec("DELETE FROM clients *;")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end

  define_method(:update) do |attributes|
    @client_name = attributes.fetch(:client_name)
    @id = self.id()
    DB.exec("UPDATE clients SET client_name = '#{@client_name}' WHERE id = #{@id};")
  end

  define_singleton_method(:find) do |id|
    Client.all().each do |client|
      if client.id() == id
        return client
      end
    end
  end
end
