class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :happy_level
  belongs_to :public
  belongs_to :user

  validates :title, presence: true
  validates :text,  presence: true
  validates :day,   presence: true

  validates :happy_level_id, numericality: { other_than: 1 , message: 'を選択してください'}
  validates :public_id, numericality: { other_than: 1 , message: 'を選択してください'}

  def start_time
    self.day #self.の後はsimple_calendarに表示させるためのカラムを指定
  end
end
