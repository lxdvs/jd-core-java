ARCH=linux/x86_64

all:
	Error: you must use either 'make osx' or 'make linux'

osx: jd-core-java-1.0.jar libjd-intellij.so.osx

linux: jd-core-java-1.0.jar libjd-intellij.so.linux

jd-intellij:
	hg clone https://bitbucket.org/bric3/jd-intellij

libjd-intellij.so.osx: jd-intellij
	cp jd-intellij/src/main/native/nativelib/macosx/x86_64/libjd-intellij.* ./libjd-intellij.so

libjd-intellij.so.linux: jd-intellij
	cp jd-intellij/src/main/native/nativelib/linux/x86_64/libjd-intellij.* ./libjd-intellij.so

target/jd-core-java-1.0.jar:
	mvn package

jd-core-java-1.0.jar: target/jd-core-java-1.0.jar
	cp $< $@

clean:
	rm -rf jd-core-java-1.0.jar libjd-intellij.so target jd-intellij
