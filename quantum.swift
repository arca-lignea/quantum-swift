
class Complex : CustomStringConvertible {
	var real: Double 
	var imaginary: Double 

	init(real: Double, imag: Double) {
		self.real = real
		self.imaginary = imag
	}

	func modSq() -> Double {
		return real*real + imaginary*imaginary
	}

	func mod() -> Double {
		return modSq().squareRoot()
	}

	public var description: String { 
		return "\(real) + \(imaginary)i"
	}
}

enum QState {
	case zero	
	case one
}

enum QuantumErrors: Error {
	case initError(String)
}

class Qubit {
	var alpha: Complex 
	var beta: Complex 
	
	init(alpha: Complex, beta: Complex) throws {
		if ( (alpha.modSq() + beta.modSq() - 1) < 0.01) {
			throw QuantumErrors.initError("|a|^2 + |b|^2 = 1")		
		}
		self.alpha = alpha
		self.beta = beta
	}
}

let a = Complex(real:1, imag:0.5.squareRoot() )
let b = Complex(real: 0.5.squareRoot(), imag:0)
print(a)
print(b)
