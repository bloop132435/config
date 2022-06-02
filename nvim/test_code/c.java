public class c{
	public static void main(String[] args){
		// print out first n powers of 2
		int n = Integer.parseInt(args[0]);
		for(int i = 0; i < n; i++){
			System.out.println(Math.pow(2, i));
		}
	}
}
