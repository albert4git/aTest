#include "hello.h"
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
using namespace std;


class CPolygon {
    protected:
        int width, height;
    public:
        void set_values (int a, int b)
        { width=a; height=b; }
        virtual int area (void) =0;
};

class CRectangle: public CPolygon {
    public:
        int area (void)
        { return (width * height); }
};

class CTriangle: public CPolygon {
    public:
        int area (void)
        { return (width * height / 2); }
};

namespace first
{
    int x = 5;
    int y = 10;
}
namespace second
{
    double x = 3.1416;
    double y = 2.7183;
}

int main(int argc, const char* argv[])
{
    Hello();
	Hello();
    int ar =8;
    CRectangle rect;
    CTriangle trgl;
    printf("%d Megabytes\n",  ar);
    // seek
    try
    {
        throw 20;
    }
    catch (int e)
    {
    printf("%d Megabytes\n",  ar);
    }
    try {
    }catch(int e) {
    }
    Hello();


    return 0;
}
