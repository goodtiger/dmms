package dmms

class BeanInfo {

	String name
	String memo

	static constraints = {
		memo blank:false
		name blank:false
	}
}
