# Time complexity -> O(n)
class Solution:
    def romanToInt(self, s: str) -> int:
        d={"I":1,"V":5,"X":10,"L":50,"C":100,"D":500, "M":1000 }
        if len(s)==0:
            return 0
        if len(s)==1:
            return d[s]
        l=[]
        l.append(s[0])
        i=1
        while True:
            if d[s[i]]<=d[s[i-1]]:
                l.append(s[i])
                i+=1
            else:
                l[-1]=l[-1]+s[i]
                d[l[-1]]= d[l[-1][1]] - d[l[-1][0]]
                i+=1
            if i==len(s):
                break
                
        sum=0
        for i in l:
            sum=sum+d[i]
        
        return sum
        