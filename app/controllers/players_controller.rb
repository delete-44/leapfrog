class PlayersController < ApplicationController
  before_action :set_player, only: %i[update]

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      redirect_to game_path(@player.current_node.game), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:current_node_id)
    end
end
