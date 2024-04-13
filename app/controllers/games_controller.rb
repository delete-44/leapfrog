class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]

  # GET /games
  def index
    @games = Game.all
  end

  # GET /games/1
  def show
    if Player.any?
      @player = Player.first
    else
      @player = Player.create(current_node: @game.starting_node)
    end

    @current_node = @player.current_node
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  def create
    @game = Game.new

    if @game.save
      redirect_to edit_game_path(@game), notice: "Game was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      redirect_to @game, notice: "Game was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
    redirect_to games_url, notice: "Game was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game)
    end
end
