module Worked
  module Work
    extend Press

    def self.run(data)
      pdfm __FILE__, __method__, data
    end
  end
end
