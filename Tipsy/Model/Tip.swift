import Foundation;

class Tip {
    var totalPrice: Double?;
    var numberOfPeople: Int?;
    var tipPercentage: Int?;
    
    init(totalPrice: Double, numberOfPeople: Int, tipPercentage: Int) {
        self.totalPrice = totalPrice
        self.numberOfPeople = numberOfPeople
        self.tipPercentage = tipPercentage
    }
    
    func calculatePricePerPerson() -> Double {
        if let totalPrice = totalPrice, let tipPercentage = tipPercentage, let numberOfPeople = numberOfPeople {
            let raw = (totalPrice * getTipMultiplier(forPercentage: tipPercentage)) / Double(numberOfPeople);
            let roundedResult = round(raw * 100.0) / 100.0;
            return roundedResult;
        }
        return 0.0;
    }
    
    func getStringifiedCalculation() -> String {
        return "Split between \(self.numberOfPeople ?? 0) people with \(self.tipPercentage ?? 0)% tip.";
    }
    
    private func getTipMultiplier(forPercentage percentage: Int) -> Double {
        switch percentage {
        case 10: return 1.1;
        case 20: return 1.2;
        default: return 0.0;
        }
        
    }
}
