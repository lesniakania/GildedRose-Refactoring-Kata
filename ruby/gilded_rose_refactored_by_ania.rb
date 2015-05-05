class ItemWrapper
  MAX_QUALITY = 50

  attr_accessor :item

  def initialize(item)
    @item = item
  end

  def name
    item.name
  end

  def sell_in
    item.sell_in
  end

  def quality
    item.quality
  end

  def name=(name)
    item.name = name
  end

  def sell_in=(sell_in)
    item.sell_in = sell_in
  end

  def quality=(quality)
    item.quality = quality
  end

  def update_sell_in
    self.sell_in -= 1
  end

  def update_quality
    if quality > 0
      self.quality -= 1
    end
  end

  def update_quality_after_sell_in_passed
    update_quality
  end

  private

  def increase_quality(offset)
    if quality < MAX_QUALITY
      self.quality += offset
    end
  end
end

class SulfurasItem < ItemWrapper
  def update_sell_in
  end

  def update_quality
  end

  def update_quality_after_sell_in_passed
  end
end

class BackstageItem < ItemWrapper
  def update_quality
    increase_quality(1)

    return increase_quality(2) if sell_in < 6
    increase_quality(1) if sell_in < 11
  end

  def update_quality_after_sell_in_passed
    self.quality = 0
  end
end

class BrieItem < ItemWrapper
  def update_quality
    increase_quality(1)
  end

  def update_quality_after_sell_in_passed
    increase_quality(1)
  end
end

class ConjuredItem < ItemWrapper
  def update_quality
    self.quality -= 2
    self.quality = 0 if quality < 0
  end

  def update_quality_after_sell_in_passed
    # actually not sure about this being empty
    # I think should be
    # update_quality as well as
    # "Once the sell by date has passed, Quality degrades twice as fast."
    # is general rule
  end
end

class GildedRose
  ITEMS_REPO = {
    "Sulfuras, Hand of Ragnaros" => SulfurasItem,
    "Backstage passes to a TAFKAL80ETC concert" => BackstageItem,
    "Aged Brie" => BrieItem,
    "Conjured Mana Cake" => ConjuredItem
  }

  def initialize(items)
    @items = items.map do |item|
      klass = ITEMS_REPO[item.name] || ItemWrapper
      klass.new(item)
    end
  end

  def update_quality()
    @items.each do |item|
      item.update_quality
      item.update_sell_in

      if item.sell_in < 0
        item.update_quality_after_sell_in_passed
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
