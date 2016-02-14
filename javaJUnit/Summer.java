/**
 * The Summer class sums up integers.
 * @author ynonperek
 *
 */
public class Summer {
	int total;

        public static void main(String args[]) {
            System.out.print("xxx");
        }
	/**
	 * Adds an integer to this object's sum
	 * @param number
	 */
	public void add(int number) {
		this.total += number;
	}

	/**
	 * Returns the sum of all the integers added so far
	 */
	public int calcSum() {
		return this.total;
	}
}
