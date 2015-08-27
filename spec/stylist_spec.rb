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

  describe('.find_name') do
    it("will find a stylist") do
      test_stylist = Stylist.new({:name => "Penny Thompson", :id => nil})
      test_stylist1 = Stylist.new({:name => "Randy Johnson", :id => nil})
      test_stylist.save()
      test_stylist1.save()
      expect(Stylist.find("Penny Thompson")).to(eq(name))
    end
  end

  describe('.find_id') do
    it("will find a stylist") do
      test_stylist = Stylist.new({:name => "Penny Thompson", :id => nil})
      test_stylist1 = Stylist.new({:name => "Randy Johnson", :id => nil})
      test_stylist.save()
      test_stylist1.save()
      expect(Stylist.find(test_stylist)).to(eq(test_stylist))
    end
  end



end
