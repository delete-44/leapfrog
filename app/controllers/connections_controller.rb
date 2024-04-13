class ConnectionsController < ApplicationController

  # POST /connections
  def create
    @connection = Connection.new(connection_params)

    if @connection.save
      redirect_to edit_game_path(@connection.parent_node.game), notice: "Connection was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def connection_params
      params.require(:connection).permit(:parent_node_id, :child_node_id)
    end
end
