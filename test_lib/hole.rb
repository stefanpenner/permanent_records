class Hole < ActiveRecord::Base
  # Because when we're destroying a mole hole we're obviously using high explosives.
  belongs_to :dirt, :dependent => :destroy

  # muskrats are permanent
  has_many :muskrats, :dependent => :destroy
  # moles are not permanent
  has_many :moles, :dependent => :destroy

  has_one :location, :dependent => :destroy
  has_one :unused_model, :dependent => :destroy
  has_one :difficulty, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  def destroy(*args)
    puts 'about to destroy'
    r = super
    puts "destroyed :#{reload.deleted_at}"
    r
  end
end