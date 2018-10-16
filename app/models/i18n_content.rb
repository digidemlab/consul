class I18nContent < ActiveRecord::Base

  scope :by_key, -> (key){ where(key: key) }
  scope :begins_with_key, -> (key){ where("key ILIKE ?", "#{key}?%") }

  validates :key, uniqueness: true

  translates :value, touch: true
  globalize_accessors locales: [:sv, :en, :de, :es, :fr, :nl, 'pt-BR']

end
