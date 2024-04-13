class NodesController < ApplicationController
  before_action :set_node, only: %i[update]

  # POST /nodes
  def create
    @node = Node.new(node_params)

    if @node.save
      redirect_to edit_game_path(@node.game), notice: "Node was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /nodes/1
  def update
    if @node.update(node_params)
      redirect_to edit_game_path(@node.game), notice: "Node was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

    def set_node
      @node = Node.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def node_params
      params.require(:node).permit(:game_id, :description)
    end
end
