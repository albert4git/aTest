def main():
    def findMin(x):
        minNum = x[0]
        for i in x:
            if minNum > i:
                minNum = i
        return minNum

    print(findMin([4, 2, 3, 1]))


if __name__ == '__main__':
    main()
