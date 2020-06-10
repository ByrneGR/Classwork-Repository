require "singleton"

class NullPiece
    attr_reader :color, :symbol
    include Singleton
    def initialize
        @color = nil
        @symbol = :nullpiece
    end

    # def inspect
    #     print "_"
    # end

    def to_s
        "▢"
    end
end


# https://ruby-doc.org/stdlib-2.5.1/libdoc/singleton/rdoc/Singleton.html