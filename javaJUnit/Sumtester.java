import junit.framework.Assert;
import junit.framework.TestCase;
// import org.junit.Test;

/** Description of Sumtester
 * @version version
 * @author alf
 * @version 1.0z Build 9000 Jan 3, 1970.
 */
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
    2016-02-14 2016-02-14T22:34:55

		Assert.assertEquals(60, s.calcSum());
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
	 * Verifies devision by 2
	 *
	 */
	public void testParts() {
		Summer s = new Summer();
		s.add(20);
		s.part(2);
		Assert.assertEquals(10, s.calcSum());
	}
	/**
	 * Verifies initial value
	 */
	public void testZeros() {
		Summer s = new Summer();
		Assert.assertEquals(0, s.calcSum());
	}
}
