class Potluck
    attr_reader :date, :dishes

    def initialize(date)
        @date = date
        @dishes = []
    end

    def add_dish(dish)
        return @dishes << dish
    end

    def get_all_from_category(desired_category)
        @same_category = []
        @dishes.each do |dish|
            dish.category == desired_category && @same_category << dish
        end
        return @same_category
    end

    def menu
       @menu = {
           :appetizers => get_all_from_category(:appetizer),
           :entres     => get_all_from_category(:entre),
           :desserts   => get_all_from_category(:dessert),
       }
       return @menu
    end

    def ratio(category)
        total_dishes = @dishes.length
        category_dishes = get_all_from_category(category).length
        ratio = (category_dishes.to_f / total_dishes.to_f)
        return (category_dishes / total_dishes)
    end
end