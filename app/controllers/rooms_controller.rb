class RoomsController < ApplicationController

  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params) #kこのときのパラメータの中身を見てみると、{"authenticity_token"=>"ReYlw+B+fWe+6hWewWlG9QwAr+h677mbPO4NVs76KjtAK0e3FyndklxPtq49bunR/lhil3Qy3dP+8tvenPqF6w==", "room"=>{"name"=>"sample", "user_ids"=>["1", "6"]}, "commit"=>"Create Room", "controller"=>"rooms", "action"=>"create"}これだけの情報が送られてきている。
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: []) #roomsテーブルに:name, user_ids: []だけを保存できるようにする
  end
end
