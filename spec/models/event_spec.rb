require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

  describe '出来事の保存' do
    context '出来事が投稿できる場合' do
      it 'タイトルと内容と日にちとレベルと公開/非公開が入力されていれば投稿できる' do
        expect(@event).to be_valid
      end
    end
    context '出来事が投稿できない場合' do
      it 'タイトルが空では投稿できない' do
        @event.title = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("タイトルを入力してください")
      end  
      it '内容が空では投稿できない' do
        @event.text = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("内容を入力してください")
      end    
      it '日にちが選択されていなくては投稿できない' do
        @event.day = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("日にちを入力してください")
      end  
      it 'レベルが選択されていなくては投稿できない' do
        @event.happy_level_id = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("幸せレベルを選択してください")
      end  
      it '公開/非公開が選択されていなくては投稿できない' do
        @event.public_id = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("公開/非公開を選択してください")
      end   
      it 'ユーザーが紐付いていなければ投稿できない' do
        @event.user = nil
        @event.valid?
        expect(@event.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
