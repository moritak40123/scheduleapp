require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    @schedule = FactoryBot.build(:schedule)
  end

  describe 'スケジュール投稿' do
    context 'スケジュールが投稿できる場合' do
      it 'titleとstart_timeが存在していれば保存できる' do
        expect(@schedule).to be_valid
      end
      it 'bodyが空でも保存できる' do
        @schedule.body = ''
        expect(@schedule).to be_valid
      end
    end
    context 'スケジュールが投稿できない場合' do
      it 'titleが空では保存できない' do
        @schedule.title = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Title can't be blank")
      end
      it 'start_timeが空では保存できない' do
        @schedule.start_time = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Start time can't be blank")
      end
      it 'end_timeが空では保存できない' do
        @schedule.end_time = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("End time can't be blank")
      end
      it 'roomが紐付いていないと保存できない' do
        @schedule.room = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include('Room must exist')
      end
      it 'userが紐付いていないと保存できない' do
        @schedule.user = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include('User must exist')
      end
    end
  end
end
