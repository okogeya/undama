class Public < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '非公開' },
    { id: 3, name: '公開' },
  ]

   include ActiveHash::Associations
   has_many :events
  end