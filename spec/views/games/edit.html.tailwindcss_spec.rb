require 'rails_helper'

RSpec.describe "games/edit", type: :view do
  let(:game) {
    Game.create!(
      node: nil
    )
  }

  before(:each) do
    assign(:game, game)
  end

  it "renders the edit game form" do
    render

    assert_select "form[action=?][method=?]", game_path(game), "post" do

      assert_select "input[name=?]", "game[node_id]"
    end
  end
end
