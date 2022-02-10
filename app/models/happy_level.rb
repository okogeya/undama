class HappyLevel < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '大大吉' },
    { id: 3, name: '大吉' },
    { id: 4, name: '吉' },
  ]

   include ActiveHash::Associations
   has_many :events

  end