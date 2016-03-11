require 'csv'

module Grbio
  module Metadata

    class << self

      def report
        r = '' 
        Grbio::SOURCE_DATA.each do |k, v|
          r << k.to_s + ": " + Grbio.headers(k).join(",") + "\n"
        end
        r
      end

      def collections_unified?
        a =  Grbio.headers(:collections) 
        b =  Grbio.headers(:collections_pers)
        a + b - (a & b)
      end

      def labels_unified?
        a = Grbio.headers(:institutions_labels)
        b = Grbio.headers(:collections_labels) 
        c = Grbio.headers(:collections_pers_labels)
        d = Grbio.headers(:staff_labels)
        h = {}
        [a,b,c,d].each do |e|
          e.each do |f|
            h[f] ? h[f] += 1 : h[f] = 1
          end
        end
        
        h.collect{|k,v|
          v == 1 ? k : nil
        }.compact
      end

      def collections_fields
        Grbio.headers(:collections) | Grbio.headers(:collections_pers)
      end

      def labels_fields
        Grbio.headers(:institutions_labels) |
        Grbio.headers(:collections_labels) |
        Grbio.headers(:collections_pers_labels) |
        Grbio.headers(:staff_labels)
      end
     
    end
  end
end
