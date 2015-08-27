require('spec_helper')

describe Client do
  describe('#name') do
    it("returns the name of the client with their id") do
        test_client = Client.new({:name => "Penny Thompson", :id => nil, :stylist_id => nil})
        expect(test_client.name()).to(eq("Penny Thompson"))
        expect(test_client.id().to_i).to(be_instance_of(Fixnum))
        expect(test_client.stylist_id().to_i).to(be_instance_of(Fixnum))
    end
  end
end
  #
  # describe('.all') do
  #   it("will return an empty array at first") do
  #     expect(Stylist.all()).to(eq([]))
  #   end
  # end
  #
  # describe('#save') do
  #   it("will save a stylist's name and id in the stylist table") do
  #     test_stylist = Stylist.new({:name => "Randy Johnson", :id => nil})
  #     test_stylist.save()
  #     expect(Stylist.all()).to(eq([test_stylist]))
  #   end
  # end
  #
  # describe('.==') do
  #   it("will override the string comparison") do
  #     test_stylist = Stylist.new({:name => "Randy Johnson", :id => nil})
  #     test_stylist1 = Stylist.new({:name => "Randy Johnson", :id => nil})
  #     expect(test_stylist).to(eq(test_stylist1))
  #   end
  # end
