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
end
