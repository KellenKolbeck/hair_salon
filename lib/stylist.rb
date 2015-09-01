class Stylist

attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_stylist = DB.exec("SELECT * FROM stylists;")
    stylist_list = []
      returned_stylist.each() do |stylist|
        name = stylist.fetch('name')
        id = stylist.fetch('id').to_i()
        stylist_list.push(Stylist.new({:name => name, :id => id}))
      end
    stylist_list
  end


  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  define_method(:==) do |another_stylist|
    self.name() == another_stylist.name && self.id() ==another_stylist.id()
  end

  define_singleton_method(:clear) do
    DB.exec("DELETE FROM stylists *;")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    @id = self.id()
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_singleton_method(:find) do |id|
    Stylist.all().each do |stylist|
      if stylist.id() == id
        return stylist
      end
    end
  end

  define_method(:clients) do
    list_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE id = #{self.id()}")
    clients.each() do |client|
      name = client.fetch("client_name")
      stylist_id = client.fetch("stylist_id").to_i()
      id = client.fetch("id").to_i()
      list_clients.push(Stylist.new(:client_name => client_name, :id =>id, :stylist_id => stylist_id))
    end
    list_clients
  end
end
