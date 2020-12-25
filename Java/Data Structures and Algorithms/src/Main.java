import java.util.Scanner;

public class Main {
    static Scanner input = new Scanner( System.in );

    public static void main( String[] args ) {
        int N;
        System.out.println( "Give N:" );
        N = input.nextInt();
        QuickUnionUF uf = new QuickUnionUF( N );
        uf.print();
        System.out.println( uf.connected( 1, 2 ) );
        uf.union(1, 2);
        System.out.println( uf.connected( 1, 2 ) );
    }
}
