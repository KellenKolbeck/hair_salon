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

  # define_singleton_method(:find_name) do |stylist|
  #   found_stylist = nil
  #   Stylist.all().each() do |person|
  #     if person.name() == stylist
  #       found_stylist = stylist
  #     end
  #   end
  #   found_stylist
  # end
  #
  # define_singleton_method(:find_id) do |id|
  #   found_stylist = nil
  #   Stylist.all.each() do |person|
  #     if person.id() == id
  #       found_stylist = id
  #     end
  #   end
  #   found_stylist
  # end




end
