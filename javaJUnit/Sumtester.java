import junit.framework.Assert;
import junit.framework.TestCase;
// import org.junit.Test;


public class Sumtester extends TestCase {

	/**
	 * Verifies positive numbers additions.
	 * 10 + 20 + 30 = 60
	 */
	public void testPositiveNumbers() {
		Summer s = new Summer();
		s.add(10);
		s.add(20);
		s.add(30);

		Assert.assertEquals(40, s.calcSum());
	}

	/**
	 * Verifies negative numbers additions
	 * (-10) + (-20) + (-30) = -60
	 */
	public void testNegativeNumbers() {
		Summer s = new Summer();
		s.add(-10);
		s.add(-20);
		s.add(-30);

		Assert.assertEquals(-60, s.calcSum());
	}

	/**
	 * Verifies initial value
	 */
	public void testZeros() {
		Summer s = new Summer();
		Assert.assertEquals(0, s.calcSum());
	}
}
