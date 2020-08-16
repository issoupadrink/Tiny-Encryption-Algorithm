class TinyEncryptionAlgorithm
  
    def self.uint32_t(n) 
        n -= 4_294_967_296 while (n > 4_294_967_295)
        n += 4_294_967_296 while (n < 0)
        return n.to_i
    end

    def self.encrypt(v, k)
        v0 = v[0]
        v1 = v[1]
        sum = 0
        i = 32

        delta = 0x9E3779B9

        k0 = k[0]
        k1 = k[1]
        k2 = k[2]
        k3 = k[3]

        while i > 0 do
            sum = uint32_t(sum + delta)
            v0 = uint32_t(v0 + (uint32_t((v1<<4) + k0) ^ uint32_t(v1 + sum) ^ uint32_t((v1>>5) + k1)))
            v1 = uint32_t(v1 + (uint32_t((v0<<4) + k2) ^ uint32_t(v0 + sum) ^ uint32_t((v0>>5) + k3)))
            i -= 1
        end

        return [v0, v1]
    end

    def self.decrypt(v, k)
        v0 = v[0]
        v1 = v[1]
        sum = 0xC6EF3720
        i = 32

        delta = 0x9E3779B9

        k0 = k[0]
        k1 = k[1]
        k2 = k[2]
        k3 = k[3]

        while i > 0 do
            v1 = uint32_t(v1 - (uint32_t((v0<<4) + k2) ^ uint32_t(v0 + sum) ^ uint32_t((v0>>5) + k3)))
            v0 = uint32_t(v0 - (uint32_t((v1<<4) + k0) ^ uint32_t(v1 + sum) ^ uint32_t((v1>>5) + k1)))
            sum = uint32_t(sum - delta)
            i -= 1
        end

        return [v0, v1]
    end
end
