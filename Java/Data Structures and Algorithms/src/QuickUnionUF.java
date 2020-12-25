public class QuickUnionUF {

    private int[] id;

    public QuickUnionUF( int N ) {
        id = new int[N];
        for ( int i = 0; i < id.length; i++ ) {
            id[i] = i;
        }
    }

    // A bit quicker
    public int root(int p){
        while( p != id[p]) p = id[p];
        return p;
    }

    public Boolean connected( int p, int q ) {
        return ( root(p) == root(q) );
    }

    public void union( int p, int q ) {
        int p_root = root(p);
        int q_root = root(q);
        id[p_root] = q_root;
    }

    public void print(){
        for(int i = 0; i < id.length; i++){
            System.out.print(id[i] + " ");
        }
        System.out.println();
    }

}
