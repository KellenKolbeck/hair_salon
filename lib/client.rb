class Client

attr_reader(:name, :id, :stylist_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    client_list = []
      returned_clients.each() do |customer|
        name = customer.fetch('name')
        id = customer.fetch('id').to_i()
        stylist_id = customer.fetch('stylist_id')
        client_list.push(Client.new({:name => name, :id => id, :stylist_id => stylist_id}))
      end
    client_list
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  define_method(:==) do |another_client|
    self.name() == another_client.name() && self.id() ==another_client.id()
  end
end
