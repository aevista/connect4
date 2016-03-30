require 'spec_helper'

describe Player do 
    context "#initialize" do
        
        it { expect{Player.new()}.to raise_error ArgumentError }

        
        player = Player.new( {:name => "Andrew", :mark=> "o"} )
        it { expect( player.name ).to eq "Andrew"}
        it { expect( player.mark ).to eq "o"}
        

        info = {:name => "Bob", :mark => "o"}
        it { expect {Player.new(info)}.to_not raise_error }

    end
end