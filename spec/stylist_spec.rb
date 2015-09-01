require('spec_helper')

describe Stylist do
  describe('#name') do
    it("returns the name of the stylist with their id") do
        test_stylist = Stylist.new({:name => "Penny Thompson", :id => nil})
        expect(test_stylist.name()).to(eq("Penny Thompson"))
        expect(test_stylist.id().to_i).to(be_instance_of(Fixnum))
    end
  end

  describe('.all') do
    it("will return an empty array at first") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("will save a stylist's name and id in the stylist table") do
      test_stylist = Stylist.new({:name => "Randy Johnson", :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe('.==') do
    it("will override the string comparison") do
      test_stylist = Stylist.new({:name => "Randy Johnson", :id => nil})
      test_stylist1 = Stylist.new({:name => "Randy Johnson", :id => nil})
      expect(test_stylist).to(eq(test_stylist1))
    end
  end

  describe('.clear') do
    it("will clear the stylists from the .all array") do
      test_stylist = Stylist.new({:name => "Randy Johnson", :id => nil})
      Stylist.clear()
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#delete') do
    it("will remove a stylist from the database table") do
      test_stylist = Stylist.new({:name => "Randy Johnson", :id => nil})
      test_stylist.save()
      test_stylist1 = Stylist.new({:name => "Penny Thompson", :id => nil})
      test_stylist1.save()
      test_stylist.delete()
      expect(Stylist.all()).to(eq([test_stylist1]))
    end
  end

  describe('#update') do
    it("will update the name of a stylist") do
      test_stylist = Stylist.new({:name => "Randy Johnson", :id => nil})
      test_stylist.save()
      test_stylist.update({:name => "Ricky Jammin"})
      expect(test_stylist.name()).to(eq("Ricky Jammin"))
    end
  end

  describe(".find") do
    it("will find a stylist by thier id") do
      test_stylist = Stylist.new({:name => "Randy Johnson", :id => nil})
      test_stylist.save()
      test_stylist1 = Stylist.new({:name => "Penny Thompson", :id => nil})
      test_stylist1.save()
      expect(Stylist.find(test_stylist1.id())).to(eq(test_stylist1))
    end
  end

  describe("#clients") do
    it("will return an array of clients for that stylist") do
      test_stylist = Stylist.new({:name => "Randy Johnson", :id => nil})
      test_stylist.save()
      test_client = Client.new({:client_name => "Randy Johnson", :id => nil, :stylist_id => nil})
      test_client.save()
      test_client1 = Client.new({:client_name => "Penny Thompson", :id => nil, :stylist_id => nil})
      test_client1.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client1]))
    end
  end
end
