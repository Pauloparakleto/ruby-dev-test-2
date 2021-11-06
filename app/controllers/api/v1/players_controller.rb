# frozen_string_literal: true

module Api
  module V1
    # Players controller
    # Only the album creation would need players association
    class PlayersController < ApplicationController
      def index
        @players = Player.all
        render json: @players
      end

      def show
        @player = Player.find(params[:id])
        render json: @player
      end

      def create
        @player = Player.create(players_params)
        if @player
          render json: @player, status: :created
        else
          render json: @player.errors.full_messages, status: :unprocessable_entity
        end
      end

      def update
        @player = Player.find(params[:id])
        if @player.update(players_params)
          render json: @player, status: :ok
        else
          render json: @player.errors.full_messages, status: :unprocessable_entity
        end
      end

      def destroy
        @player = Player.find(params[:id])
        @player.destroy
        render json: @player, status: :ok
      end

      private

      def players_params
        params.require(:player).permit(:name)
      end
    end

  end
end
