require 'rspec'
require 'spec_helper'

require 'tiny_encryption_algorithm'

describe TinyEncryptionAlgorithm do
    describe ".uint32_t" do
        context "given addition without overflow" do
            it "returns the correct value" do
                a = TinyEncryptionAlgorithm.uint32_t(30)
                b = TinyEncryptionAlgorithm.uint32_t(12)
                c = 42

                expect(a + b).to eq(c)
            end
        end

        context "given addition with an overflow" do
            it "returns expected value" do 
                a = 4_294_967_295
                b = 1
                c = 0

                expect(TinyEncryptionAlgorithm.uint32_t(a + b)).to eq(c)
            end
        end

        context "given subtraction with an overflow" do
            it "returns expected value" do 
                a = 0
                b = 1
                c = 4_294_967_295

                expect(TinyEncryptionAlgorithm.uint32_t(a - b)).to eq(c)
            end
        end
    end

    describe ".encrypt" do 
        context "given a plaintext string" do
            it "returns a ciphertext" do
                expect(TinyEncryptionAlgorithm.encrypt([1385482522,639876499], [1,2,3,4])).to eq([1479724452, 1327024861])
            end
        end
    end

    describe ".decrypt" do 
        context "given a ciphertext" do
            it "returns a plaintext string" do
                expect(TinyEncryptionAlgorithm.decrypt([1479724452, 1327024861], [1,2,3,4])).to eq([1385482522,639876499])
            end
        end
    end
end