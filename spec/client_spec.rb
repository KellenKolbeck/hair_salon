require('spec_helper')

describe Client do
  describe('#name') do
    it("returns the name of the client with their id") do
        test_client = Client.new({:name => "Penny Thompson", :id => nil, :stylist_id => 1})
        expect(test_client.name()).to(eq("Penny Thompson"))

    end
  end

  describe('#stylist_id') do
    it("will read a stylist_id") do
      test_client = Client.new({:name => "Penny Thompson", :id => nil, :stylist_id => 1})
      expect(test_client.stylist_id()).to(eq(1))
    end
  end

  describe('.all') do
    it("will return an empty array at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("will save a client's name and id in the client table") do
      test_client = Client.new({:name => "Penny Thompson", :id => nil, :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end


  describe('.==') do
    it("will override the string comparison") do
      test_client = Client.new({:name => "Randy Johnson", :id => nil, :stylist_id => 1})
      test_client1 = Client.new({:name => "Randy Johnson", :id => nil, :stylist_id => 1})
      expect(test_client).to(eq(test_client1))
    end
  end

  describe('.clear') do
    it("will clear the clients from the .all array") do
      test_client = Client.new({:name => "Randy Johnson", :id => nil, :stylist_id => 1})
      Client.clear()
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#delete') do
    it("will remove a client from the database table") do
      test_client = Client.new({:name => "Randy Johnson", :id => nil, :stylist_id => 1})
      test_client.save()
      test_client1 = Client.new({:name => "Penny Thompson", :id => nil, :stylist_id => 2})
      test_client1.save()
      test_client.delete()
      expect(Client.all()).to(eq([test_client1]))
    end
  end
end
