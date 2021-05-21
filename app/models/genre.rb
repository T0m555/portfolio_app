class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'Ruby' },
    { id: 3, name: 'JavaScript' },
    { id: 4, name: 'HTML, CSS' },
    { id: 5, name: 'Python' },
    { id: 6, name: 'C, C++' },
    { id: 7, name: 'C#' },
    { id: 8, name: '' },
    { id: 9, name: '' },
    { id: 10, name: '' },
    { id: 11, name: '' },
    { id: 12, name: '' },
    { id: 13, name: '' },
    { id: 14, name: '' }
  ]
  include ActiveHash::Associations
  has_many :items
end
